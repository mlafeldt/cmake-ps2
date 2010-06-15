#include <tamtypes.h>
#include <sifcmd.h>
#include <kernel.h>
#include <sifrpc.h>
#include <stdio.h>
#include <debug.h>
#include "sio.h"

int main()
{   
   SifInitRpc(0); 

//   init_scr();
//   scr_printf("Hello, world!\n"); // hello world in the screen
#if 0
   printf("Hello, world!\n");
   nprintf("Hello, again, from Naplink RPC!\n");
   
   sio_init(115200, 0, 0, 0, 0);
   sio_printf("Hello from EE SIO!\n");
#endif
   /* Return to the bootloader or PS2 browser. */
   return 0;
}
