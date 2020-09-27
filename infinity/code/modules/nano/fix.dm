/*NanoUI loading fix.
Requires http server and zipfile compilation script
*/

#define NANOHTTP_PORT 1500

/client/New()
	preload_rsc = "http://[world.internet_address]:[NANOHTTP_PORT]/nano.zip"
	. = ..()