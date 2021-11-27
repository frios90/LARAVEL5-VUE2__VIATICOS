require('./bootstrap')
/**
 * Inicio con Vue
 *  */
    window.Vue = require('vue')
    window.VueResource = require('vue-resource')
  
/**
 * Para modales dinamicos
 */
    import VModal from 'vue-js-modal' 
    Vue.use(VModal)
    Vue.use(VModal, { dialog: true })

 /**
 * Para la aplicaón de formatos numericos. Moneda.
 */
    import VueCurrencyFilter from 'vue-currency-filter'
    Vue.use(VueCurrencyFilter,
    {
        symbol : '$',
        thousandsSeparator: '.',
        fractionCount: 0,
        fractionSeparator: '',
        symbolPosition: 'front',
        symbolSpacing: true
    })

/**
 * Para uso de toast en alertas
 */
    import Toasted from 'vue-toasted';
    Vue.use(Toasted)
    Vue.toasted.register('APP_GENERAL_ERROR', 'Algo a salido mal. Vuelva a intentarlo.', {
        type : 'error',
        icon : 'Error',
        duration: 3000,
        singleton: true
    })
    Vue.toasted.register('APP_GENERAL_ERROR_FORM', 'Errores en el llenado del formulario', {
        type : 'error',
        icon : 'Error',
        duration: 3000,
        singleton: true
    })
    Vue.toasted.register('APP_GENERAL_SUCCESS', 'Operación realizada con exito.', {
        type : 'success',
        icon : 'Bien',
        duration: 3000,
        singleton: false
    })

/** 
 * Para creación de tablas en index de mantenedores
*/
    import {ServerTable, ClientTable, Event} from 'vue-tables-2';
    Vue.use(ClientTable, {}, false, 'bootstrap4');
/**
 * Para validación y formato de rut
 */
    import { rutValidator, rutFilter, rutInputDirective } from 'vue-dni';
    Vue.directive('rut', rutInputDirective);

/**
 * Para el uso de mensajes con SweerAlert2
 */
    import VueSweetalert2 from 'vue-sweetalert2'; 
    Vue.use(VueSweetalert2);

/**
 * Para visor de imágenes
 */
    import 'viewerjs/dist/viewer.css'
    import Viewer from 'v-viewer'
    Vue.use(Viewer)


    
    Vue.component('app', require('./master/AppComponent'))
    Vue.component('app-menu', require('./master/MenuComponent')) 
    Vue.component('app-nav', require('./master/NavComponent')) 
    Vue.component('modal-list', require('./master/ModalListComponent'))
    Vue.component('view-head-detail-request', require('./master/ViewHeadDetailRequest')) 
    Vue.component('view-detail-rates-list', require('./master/ViewDetailRatesList')) 
    Vue.component('view-navigation', require('./master/ViewNavigationList')) 
    Vue.component('add-rate', require('./master/AddRate')) 
    Vue.component('view-detail-accredit', require('./master/ViewDetailAccredit')) 

/** integración de widgets */
    Vue.component('widget-total-requests-month', require('./components/reports/widgets/TotalRequestMonthWidget'))
    Vue.component('widget-requests-for-state', require('./components/reports/widgets/RequestsForState'))


    Vue.component('widget-chat', require('./components/chat/Chat'))

/**
 * Para el uso de Vue Router
 */
    import router from './router' 
    import store from './store.js'        
    const app = new Vue({
        router,
        store,
        el: '#app',
    })