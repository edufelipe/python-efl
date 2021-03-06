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

cdef class Check(Object):
    def __init__(self, c_evas.Object parent):
        Object.__init__(self, parent.evas)
        self._set_obj(elm_check_add(parent.obj))

    def label_set(self, label):
        elm_check_label_set(self.obj, label)

    def label_get(self):
        cdef const_char_ptr l
        l = elm_check_label_get(self.obj)
        if l == NULL:
            return None
        return l

    property label:
        def __get__(self):
            return self.label_get()

        def __set__(self, value):
            self.label_set(value)

    def icon_set(self, c_evas.Object icon):
        elm_check_icon_set(self.obj, icon.obj)

    def icon_get(self):
        cdef c_evas.Evas_Object *icon
        icon = elm_check_icon_get(self.obj)
        return evas.c_evas._Object_from_instance(<long> icon)

    property icon:
        def __get__(self):
            return self.icon_get()

        def __set__(self, value):
            self.icon_set(value)

    def state_set(self, value):
        if value:
            elm_check_state_set(self.obj, 1)
        else:
            elm_check_state_set(self.obj, 0)

    def state_get(self):
        cdef c_evas.Eina_Bool state
        state = elm_check_state_get(self.obj)
        if state == 0:
            return False
        else:
            return True

    property state:
        def __get__(self):
            return self.state_get()

        def __set__(self, value):
            self.state_set(value)

    def callback_changed_add(self, func, *args, **kwargs):
        self._callback_add("changed", func, *args, **kwargs)

    def callback_changed_del(self, func):
        self._callback_del("changed", func)


_elm_widget_type_register("check", Check)
