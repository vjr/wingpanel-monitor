/*-
 * Copyright (c) 2020 Tudor Plugaru (https://github.com/PlugaruT/wingpanel-monitor)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA.
 *
 * Authored by: Tudor Plugaru <plugaru.tudor@gmail.com>
 */

namespace WingpanelMonitor {
    public class MainWindow : Hdy.ApplicationWindow {
        private Settings settings;

        public MainWindow (Gtk.Application application) {
            Object (
                application: application,
                icon_name: "com.github.plugarut.wingpanel-monitor",
                resizable: false,
                window_position: Gtk.WindowPosition.CENTER,
                default_width: 300,
                title: _("Wingpanel Monitor")
            );
        }

        construct {
            Hdy.init ();
            settings = new Settings ("com.github.plugarut.wingpanel-monitor");
            var toggles = new TogglesWidget ();

            var content = new Gtk.Grid ();
            var header = new Hdy.HeaderBar () {
                show_close_button = true,
                title = "Wingpanel Monitor"
            };

            var header_context = header.get_style_context ();
            header_context.add_class ("titlebar");
            header_context.add_class ("default-decoration");
            header_context.add_class (Gtk.STYLE_CLASS_FLAT);

            var layout = new Gtk.Grid ();
            layout.hexpand = true;
            layout.margin = 10;
            layout.column_spacing = 6;
            layout.row_spacing = 10;

            layout.attach (toggles, 0, 0);

            content.attach (header, 0, 0);
            content.attach (layout, 0, 1);

            add (content);
        }
    }
}
