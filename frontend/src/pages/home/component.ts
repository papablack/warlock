import { RWSViewComponent, RWSView, observable, _ROUTING_EVENT_NAME, IRoutingEvent } from 'rws-js-client';

import EV from '../../events/events';

@RWSView('page-home')
class HomePage extends RWSViewComponent {  
  
  connectedCallback(): void 
  {
    super.connectedCallback();    
  }
}

HomePage.defineComponent();

export { HomePage }