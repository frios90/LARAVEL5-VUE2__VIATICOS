<template>
      
         <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">

        <ul class="navbar-nav navbar-nav-right">
          
          <li class="nav-item dropdown mr-4">
            <a @click="logOut" class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center notification-dropdown" id="log-out" data-toggle="dropdown">
              Salir
            </a>
            
          </li>   
          <li class="nav-item nav-profile dropdown">
          
          </li>       
        </ul>

       
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
      </div>
   
</template>
<script>
    export default {
        name: 'create-request',
        data () {
            return {               
                csrf  : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            }
        },       
        created() {
        },
        methods: {
          logOut(){
              var data =  {
                _token: this.csrf
              }
              var self = this  
              this.$http.post('/log-out', data).then(function(response){
                   location.href = window.location
                  }, function(){
                      alert('Error!');
                  })           
            
          }
        }
    }
</script>
<style>
  .navbar-brand-wrapper,
  .navbar-menu-wrapper {
    background-color: #009690 !important;
    padding-top: 0px!important;
    color: #f8f8f8!important;
    border-style: none!important;
  }
</style>