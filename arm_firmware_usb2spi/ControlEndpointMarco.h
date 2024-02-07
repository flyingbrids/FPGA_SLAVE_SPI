/*
 * ControlEndpointMarco.h
 *
 *  Created on: May 31, 2021
 *      Author: ShenL
 */

#ifndef CONTROLENDPOINTMARCO_H_
#define CONTROLENDPOINTMARCO_H_

#include "cyu3types.h"
#include "cyu3usbconst.h"
#include "cyu3externcstart.h"



CyU3PReturnStatus_t
CyFxSPIInit (uint16_t pageLen);

CyU3PReturnStatus_t
CyFxSpiTransfer (
        uint16_t  startAddress, // register offset address
        uint16_t  byteCount,
        uint8_t  *buffer,
        CyBool_t  isRead);


/* Give a timeout value of 5s for any flash programming. */
#define CY_FX_USB_SPI_TIMEOUT                   (5000)

/* USB vendor requests supported by the application. */
#define CY_FX_RQT_ID_CHECK           (0xB0)
#define REGISTER_WRITE               (0xC2)
#define REGISTER_READ                (0xC3)

#endif /* CONTROLENDPOINTMARCO_H_ */
