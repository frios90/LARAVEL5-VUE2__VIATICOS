import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
    mode: 'history',
    base: process.env.BASE_URL,
    routes: [
       /**Rutas para home */
       {
        path: '/home',
        name: 'home',
        component: require('./components/home/General')        
      },
        /**Rutas para usuarios */
        {
          path: '/users',
          name: 'users',
          component: require('./components/admin/users/Index')        
        },
        {
          path: '/users/create',
          name: 'user.create',
          component: require('./components/admin/users/Create')        
        },
        {
          path: '/users/edit/:id',
          name: 'user.edit',
          component: require('./components/admin/users/Edit')        
      },
       /**Rutas para viáticos */
      {
        path: '/viatics',
        name: 'viatics',
        component: require('./components/admin/viatics/Index')        
      },
      {
        path: '/viatics/create',
        name: 'viatic.create',
        component: require('./components/admin/viatics/Create')        
      },
      {
        path: '/viatics/edit/:id',
        name: 'viatic.edit',
        component: require('./components/admin/viatics/Edit')        
      },
    /**Rutas para catálogo */
      {
        path: '/catalogue',
        name: 'catalogue',
        component: require('./components/admin/catalogue/Index')        
      },
      {
        path: '/catalogue/create',
        name: 'catalogue.create',
        component: require('./components/admin/catalogue/Create')        
      },
      {
        path: '/catalogue/edit/:id',
        name: 'catalogue.edit',
        component: require('./components/admin/catalogue/Edit')        
      },      
      {
        path: '/catalogue/:id/rates',
        name: 'catalogue.rates',
        component: require('./components/admin/catalogue/Rates')        
      },
      
     
    /**Rutas para solicitudes realizadas
     * por un usuario applicant
     * 
     */
      {
        path: '/request/user',  
        name: 'request.user',
        component: require('./components/requestUser/Index')        
      },
      {
        path: '/request/user/create',
        name: 'request.user.create',
        component: require('./components/requestUser/Create')        
      },
      {
        path: '/request/user/see/:id',
        name: 'request.user.see',
        component: require('./components/requestUser/See')        
      },
      {
        path: '/request/user/accredit/:id',
        name: 'request.user.accredit',
        component: require('./components/requestUser/Accredit')        
      },
      {
        path: '/request/user/edit/:id',
        name: 'request.user.edit',
        component: require('./components/requestUser/Edit')        
      },
      /**Rutas para aprobaciones
       * por un usuario project-manager
       */
      {
        path: '/request/approve',
        name: 'request.approve',
        component: require('./components/requestApprove/Index')        
      },
      {
        path: '/request/approve/see/:id',
        name: 'request.approve.see',
        component: require('./components/requestApprove/See')        
      },
      {
        path: '/request/approve/approve-manage/:id',
        name: 'request.approve.aprove-manage',
        component: require('./components/requestApprove/ApproveManage')        
      },
      {
        path: '/request/approve/see-final/:id',
        name: 'request.approve.seefinal',
        component: require('./components/requestApprove/SeeFinal')        
      },
      /**Rutas para solicitudes por gestionar por un usuario
       * administrastor
       */
      {
        path: '/request/manage',
        name: 'request.manage',
        component: require('./components/requestManage/Index')        
      },
      {
        path: '/request/manage/apply/:id',
        name: 'request.manage.apply',
        component: require('./components/requestManage/Apply')        
      },
      {
        path: '/request/manage/see-accreditation/:id',
        name: 'request.manage.see-accreditation',
        component: require('./components/requestManage/SeeAccreditation')        
      },
      {
        path: '/request/manage/edit/:id',
        name: 'request.manage.edit',
        component: require('./components/requestManage/Edit')        
      },

       /**Rutas para tipos */
      {
        path: '/types',
        name: 'types',
        component: require('./components/admin/types/Index')        
      },
      {
        path: '/type/create',
        name: 'type.create',
        component: require('./components/admin/types/Create')        
      },
      {
        path: '/type/edit/:id',
        name: 'type.edit',
        component: require('./components/admin/types/Edit')        
      },
    
     
    ]
   
  })