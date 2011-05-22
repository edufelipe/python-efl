# Copyright (c) 2008-2009 Simon Busch
#
# This file is part of python-elementary.
#
# python-elementary is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# python-elementary is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with python-elementary.  If not, see <http://www.gnu.org/licenses/>.
#

cdef class Table(Object):
    def __init__(self, c_evas.Object parent):
        Object.__init__(self, parent.evas)
        self._set_obj(elm_table_add(parent.obj))

    def homogeneous_set(self, homogeneous):
        elm_table_homogeneous_set(self.obj, homogeneous)

    def homogenous_set(self, homogeneous):
        elm_table_homogeneous_set(self.obj, homogeneous)

    def padding_set(self, horizontal, vertical):
        elm_table_padding_set(self.obj, horizontal, vertical)

    def pack(self, c_evas.Object subobj, x, y, w, h):
        elm_table_pack(self.obj, subobj.obj, x, y, w, h)

    def unpack(self, c_evas.Object subobj):
        elm_table_unpack(self.obj, subobj.obj)

    def clear(self, clear):
        elm_table_clear(self.obj, clear)


_elm_widget_type_register("table", Table)
