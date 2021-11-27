<template>
      
       <nav class="menu-color sidebar sidebar-offcanvas" id="sidebar">
        <ul  class="nav">
          <li v-for="(menu, key) in menus" :key="key" class="nav-item">
            <a class="nav-link" href="#">
              <router-link :to="{ name: menu.path }">
                <i :class="menu.class"></i>
                <span class="menu-title">{{ menu.name }}</span>
              </router-link>
            </a>
          </li>
        </ul>
      </nav> 
   
</template>
<script>
    export default {
        name: 'create-request',
        data () {
            return {               
                csrf  : document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                menus : []
            }
        },       
        created() {
          this.getMenusUserSession()
        },
        methods: {
          getMenusUserSession () {
                var self = this
                this.$http.get('/get-menus-user-session')
                .then(response => {
                    self.menus    = response.body 
                }, response => {                 
                    self.$toasted.global.APP_GENERAL_ERROR()
                })
          }
        }
    }
</script>
<style>
.menu-color a {
	color: #00a19a;
	border: 0;
}

.menu-color I {
	color: #00a19a!important;
}


.sidebar {
    max-height: calc(100vh - 60px);
    background-color: #fff;   
    font-weight: 200;
    padding: 0;
    width: 257px;
    z-index: 11;
    margin-top:28px;
    transition: width 0.25s ease, background 0.25s ease;
    -webkit-transition: width 0.25s ease, background 0.25s ease;
    -moz-transition: width 0.25s ease, background 0.25s ease;
    -ms-transition: width 0.25s ease, background 0.25s ease;
    -webkit-box-shadow: 6px 2px 30px -23px rgba(100,100,100,1);
    -moz-box-shadow: 6px 2px 30px -23px rgba(100,100,100,1);
    box-shadow: 6px 2px 30px -23px rgba(100,100,100,1);  font-family: "Roboto", sans-serif;
  
}

.sidebar:hover {
  transition: 0.5s;
  -webkit-box-shadow: 5px -1px 20px 0px rgba(170,170,170,1);
  -moz-box-shadow: 5px -1px 20px 0px rgba(170,170,170,1);
  box-shadow: 5px -1px 20px 0px rgba(170,170,170,1);

}


.sidebar .nav {
  overflow: hidden;
  flex-wrap: nowrap;
  flex-direction: column;
  margin-bottom: 60px;
}

.sidebar .nav .nav-item .nav-link {
  display: -webkit-flex;
  display: flex;
  -webkit-align-items: center;
  align-items: center;
  white-space: nowrap;
  padding: 0.75rem 2.5rem 0.75rem 1.25rem;
  color: #000;
  -webkit-transition-duration: 0.45s;
  -moz-transition-duration: 0.45s;
  -o-transition-duration: 0.45s;
  transition-duration: 0.45s;
  transition-property: color;
  -webkit-transition-property: color;
}

.sidebar .nav .nav-item .nav-link i {
  color: inherit;
}

.sidebar .nav .nav-item .nav-link i.menu-icon {
  font-size: 1.125rem;
  line-height: 1;
  margin-right: 1.125rem;
  color: inherit;
}

.rtl .sidebar .nav .nav-item .nav-link i.menu-icon {
  margin-left: 2rem;
  margin-right: 0;
}

.sidebar .nav .nav-item .nav-link i.menu-icon:before {
  vertical-align: middle;
}

.sidebar .nav .nav-item .nav-link i.menu-arrow {
  display: inline-block;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  margin-left: auto;
  margin-right: 0;
  color: #000;
}

.rtl .sidebar .nav .nav-item .nav-link i.menu-arrow {
  margin-left: 0;
  margin-right: auto;
}

.sidebar .nav .nav-item .nav-link i.menu-arrow:before {
  content: "\F140";
  font-family: "Material Design Icons";
  font-style: normal;
  display: block;
  font-size: 1rem;
  line-height: 10px;
  -webkit-transition: all 0.2s ease-in;
  -moz-transition: all 0.2s ease-in;
  -ms-transition: all 0.2s ease-in;
  -o-transition: all 0.2s ease-in;
  transition: all 0.2s ease-in;
}

.sidebar .nav .nav-item .nav-link .menu-title {
  color: inherit;
  display: inline-block;
  font-size: 0.875rem;
  line-height: 1;
  vertical-align: middle;
}

.sidebar .nav .nav-item .nav-link .badge {
  margin-left: auto;
}

.rtl .sidebar .nav .nav-item .nav-link .badge {
  margin-left: 0;
  margin-right: auto;
}


.sidebar .nav:not(.sub-menu) {
  margin-top: .3rem;
}




/* style for off-canvas menu*/
@media screen and (max-width: 991px) {
  .sidebar-offcanvas {
    position: fixed;
    max-height: calc(100vh - 60px);
    top: 60px;
    bottom: 0;
    overflow: auto;
    right: -257px;
    -webkit-transition: all 0.25s ease-out;
    -o-transition: all 0.25s ease-out;
    transition: all 0.25s ease-out;
  }
  .sidebar-offcanvas.active {
    right: 0;
  }
}
</style>