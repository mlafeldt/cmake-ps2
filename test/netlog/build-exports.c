#include "irx.h"
DECLARE_EXPORT_TABLE(netlog, 1, 1)
	DECLARE_EXPORT(_start)
	DECLARE_EXPORT(_retonly)
	DECLARE_EXPORT(_retonly)
	DECLARE_EXPORT(_retonly)

	/* 4 */
	DECLARE_EXPORT(netlog_init)
	DECLARE_EXPORT(netlog_exit)
	DECLARE_EXPORT(netlog_send)
END_EXPORT_TABLE

void _retonly() {}
