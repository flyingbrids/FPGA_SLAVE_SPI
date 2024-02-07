/*
 * ControlEndpointMarco.h
 *
 *  Created on: May 31, 2021
 *      Author: ShenL
 */
/* SPI initialization for application. */
#include "cyu3system.h"
#include "cyu3os.h"
#include "cyu3dma.h"
#include "cyu3error.h"
#include "cyu3usb.h"
#include "cyu3gpio.h"
#include "cyu3uart.h"
#include "cyu3utils.h"
#include "cyu3spi.h"
#include "ControlEndpointMarco.h"

CyU3PDmaChannel glSpiTxHandle;   /* SPI Tx channel handle */
CyU3PDmaChannel glSpiRxHandle;   /* SPI Rx channel handle */
uint16_t glSpiPageSize;  /* SPI Page size to be used for transfers. */

CyU3PReturnStatus_t
CyFxSPIInit (uint16_t pageLen)
{
    CyU3PSpiConfig_t spiConfig;
    CyU3PDmaChannelConfig_t dmaConfig;
    CyU3PReturnStatus_t status = CY_U3P_SUCCESS;

    /* Start the SPI module and configure the master. */
    status = CyU3PSpiInit();
    if (status != CY_U3P_SUCCESS)
    {
        return status;
    }

    /* Start the SPI master block. Run the SPI clock at 8MHz
     * and configure the word length to 8 bits. Also configure
     * the slave select using FW. */
    CyU3PMemSet ((uint8_t *)&spiConfig, 0, sizeof(spiConfig));
    spiConfig.isLsbFirst = CyFalse;
    spiConfig.cpol       = CyTrue;
    spiConfig.ssnPol     = CyFalse;
    spiConfig.cpha       = CyTrue;
    spiConfig.leadTime   = CY_U3P_SPI_SSN_LAG_LEAD_HALF_CLK;
    spiConfig.lagTime    = CY_U3P_SPI_SSN_LAG_LEAD_HALF_CLK;
    spiConfig.ssnCtrl    = CY_U3P_SPI_SSN_CTRL_FW;
    spiConfig.clock      = 25000000;
    spiConfig.wordLen    = 8;

    status = CyU3PSpiSetConfig (&spiConfig, NULL);
    if (status != CY_U3P_SUCCESS)
    {
        return status;
    }

    /* Create the DMA channels for SPI write and read. */
    CyU3PMemSet ((uint8_t *)&dmaConfig, 0, sizeof(dmaConfig));
    dmaConfig.size           = pageLen;
    /* No buffers need to be allocated as this channel
     * will be used only in override mode. */
    dmaConfig.count          = 0;
    dmaConfig.prodAvailCount = 0;
    dmaConfig.dmaMode        = CY_U3P_DMA_MODE_BYTE;
    dmaConfig.prodHeader     = 0;
    dmaConfig.prodFooter     = 0;
    dmaConfig.consHeader     = 0;
    dmaConfig.notification   = 0;
    dmaConfig.cb             = NULL;

    /* Channel to write to SPI flash. */
    dmaConfig.prodSckId = CY_U3P_CPU_SOCKET_PROD;
    dmaConfig.consSckId = CY_U3P_LPP_SOCKET_SPI_CONS;
    status = CyU3PDmaChannelCreate (&glSpiTxHandle,
            CY_U3P_DMA_TYPE_MANUAL_OUT, &dmaConfig);
    if (status != CY_U3P_SUCCESS)
    {
        return status;
    }

    /* Channel to read from SPI flash. */
    dmaConfig.prodSckId = CY_U3P_LPP_SOCKET_SPI_PROD;
    dmaConfig.consSckId = CY_U3P_CPU_SOCKET_CONS;
    status = CyU3PDmaChannelCreate (&glSpiRxHandle,
            CY_U3P_DMA_TYPE_MANUAL_IN, &dmaConfig);

    if (status == CY_U3P_SUCCESS)
    {
        glSpiPageSize = pageLen;
    }

    return status;
}

CyU3PReturnStatus_t
CyFxSpiTransfer (
        uint16_t  startAddress, // register offset address
        uint16_t  byteCount,
        uint8_t  *buffer,
        CyBool_t  isRead )
{
    CyU3PDmaBuffer_t buf_p;
    uint8_t overHead[1];
    CyU3PReturnStatus_t status = CY_U3P_SUCCESS;

    if (byteCount == 0)
    {
        return CY_U3P_SUCCESS;
    }

    overHead[0] = startAddress & 0xFF;
    buf_p.buffer = buffer;
    buf_p.status = 0;
    buf_p.size  = glSpiPageSize;
    buf_p.count = byteCount;

        if (isRead)
        {
        	overHead[0] = (overHead[0] << 1) + 0x01;  /* Read command. */

            CyU3PSpiSetSsnLine (CyFalse);
            status = CyU3PSpiTransmitWords (overHead, 1);

            CyU3PSpiSetBlockXfer (0, glSpiPageSize);

            status = CyU3PDmaChannelSetupRecvBuffer (&glSpiRxHandle,
                    &buf_p);
            if (status != CY_U3P_SUCCESS)
            {
                CyU3PSpiSetSsnLine (CyTrue);
                return status;
            }
            status = CyU3PDmaChannelWaitForCompletion (&glSpiRxHandle,
                    CY_FX_USB_SPI_TIMEOUT);
            if (status != CY_U3P_SUCCESS)
            {
                CyU3PSpiSetSsnLine (CyTrue);
                return status;
            }

            CyU3PSpiSetSsnLine (CyTrue);
            CyU3PSpiDisableBlockXfer (CyFalse, CyTrue);
        }
        else /* Write */
        {
        	overHead[0] = (overHead[0] << 1); /* Write command */

            CyU3PSpiSetSsnLine (CyFalse);
            status = CyU3PSpiTransmitWords (overHead, 1);

            CyU3PSpiSetBlockXfer (glSpiPageSize, 0);

            status = CyU3PDmaChannelSetupSendBuffer (&glSpiTxHandle,
                    &buf_p);
            if (status != CY_U3P_SUCCESS)
            {
                CyU3PSpiSetSsnLine (CyTrue);
                return status;
            }
            status = CyU3PDmaChannelWaitForCompletion(&glSpiTxHandle,
                    CY_FX_USB_SPI_TIMEOUT);
            if (status != CY_U3P_SUCCESS)
            {
                CyU3PSpiSetSsnLine (CyTrue);
                return status;
            }

            CyU3PSpiSetSsnLine (CyTrue);
            CyU3PSpiDisableBlockXfer (CyTrue, CyFalse);
        }

    CyU3PThreadSleep (10);
    return CY_U3P_SUCCESS;
}







