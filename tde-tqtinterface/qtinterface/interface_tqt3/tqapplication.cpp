/*

Copyright (C) 2010 Timothy Pearson <kb9vqf@pearsoncomputing.net>

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public
License as published by the Free Software Foundation; either
version 2 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Library General Public License for more details.

You should have received a copy of the GNU Library General Public License
along with this library; see the file COPYING.LIB.  If not, write to
the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
Boston, MA 02110-1301, USA.

*/

#include <tqt.h>
#include <ntqapplication.h>
#include <X11/X.h>

extern Time tqt_x_time;
extern Time tqt_x_user_time;

void set_tqt_x_time(unsigned long x) {
	tqt_x_time = x;
}

unsigned long get_tqt_x_time(void) {
	return tqt_x_time;
}

void set_tqt_x_user_time(unsigned long x) {
	tqt_x_user_time = x;
}

unsigned long get_tqt_x_user_time(void) {
	return tqt_x_user_time;
}
