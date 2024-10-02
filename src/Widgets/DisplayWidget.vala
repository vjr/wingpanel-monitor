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
    public class DisplayWidget : Gtk.Grid {
        private IndicatorWidget cpu_info;
        private IndicatorWidget ram_info;
        private IndicatorWidget workspace_info;
        private IndicatorWidget icon_only;
        private NetworkWidget network_info;

        public unowned Settings settings { get; construct set; }

        public DisplayWidget (Settings settings) {
            Object (settings: settings);
        }

        construct {
            valign = Gtk.Align.CENTER;


            cpu_info = new IndicatorWidget ("cpu-symbolic", 4);
            ram_info = new IndicatorWidget ("ram-symbolic", 4);
            workspace_info = new IndicatorWidget ("computer-symbolic", 2);
            icon_only = new IndicatorWidget ("utilities-system-monitor-symbolic", 0);
            icon_only.label_value = "";
            network_info = new NetworkWidget ();


            settings.bind ("show-cpu", cpu_info, "display", SettingsBindFlags.GET);
            settings.bind ("show-ram", ram_info, "display", SettingsBindFlags.GET);
            settings.bind ("show-network", network_info, "display", SettingsBindFlags.GET);
            settings.bind ("show-workspace", workspace_info, "display", SettingsBindFlags.GET);
            settings.bind ("icon-only", icon_only, "display", SettingsBindFlags.GET);

            add (icon_only);
            add (network_info);
            add (cpu_info);
            add (ram_info);
            add (workspace_info);
        }

        public void update_workspace (int val) {
            workspace_info.label_value = val.to_string ();
        }

        public void update_cpu (int val) {
            cpu_info.label_value = val.to_string () + "%";
        }

        public void update_memory (int val) {
            ram_info.label_value = val.to_string () + "%";
        }

        public void update_network (int upload, int download) {
            string up = WingpanelMonitor.Utils.format_net_speed (upload, true, settings.get_boolean ("show-bits"));
            string down = WingpanelMonitor.Utils.format_net_speed (download, true, settings.get_boolean ("show-bits"));
            network_info.update_label_data (up, down);
        }
    }
}
