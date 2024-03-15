

import { renderRouteComponent } from 'rws-js-client';
import { HomePage } from '../pages/home/component';
import { ServersPage } from '../pages/servers/component';


export default {
    '/': renderRouteComponent('Home page', HomePage),  
    '/servers': renderRouteComponent('Servers page', ServersPage),  
};