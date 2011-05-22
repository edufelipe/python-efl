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

cdef class Radio(Object):
    def __init__(self, c_evas.Object parent):
        Object.__init__(self, parent.evas)
        self._set_obj(elm_radio_add(parent.obj))

    def label_set(self, label):
        elm_radio_label_set(self.obj, label)

    def icon_set(self, c_evas.Object icon):
        elm_radio_icon_set(self.obj, icon.obj)

    def group_add(self, c_evas.Object group):
        elm_radio_group_add(self.obj, group.obj)

    def state_value_set(self, value):
        elm_radio_state_value_set(self.obj, value)

    def value_set(self, value):
        elm_radio_value_set(self.obj, value)

    def value_get(self):
        return elm_radio_value_get(self.obj)

    def callback_changed_add(self, func, *args, **kwargs):
        self._callback_add("changed", func, *args, **kwargs)

    def callback_changed_del(self, func):
        self._callback_del("changed", func)


_elm_widget_type_register("radio", Radio)
