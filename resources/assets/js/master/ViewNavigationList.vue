<template>
  <div class="d-flex navegation-list" >    
    <i class="mdi mdi-home text-muted hover-cursor"></i>
    <router-link to="/home">               
        <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;inicio&nbsp;/&nbsp;</p>             
    </router-link>
    <span v-for="(navigate, key) in list_navegation" :key="key">
      <span v-if="!navigate.current">
        <router-link :to="navigate.to">          
            <p class="text-muted mb-0 hover-cursor">{{ navigate.label }}&nbsp;/&nbsp;</p>
        </router-link>
      </span>
      <span v-else>      
        <p class="text-primary mb-0 hover-cursor">
          <b>{{ navigate.label }}</b>
        </p>      
      </span>
    </span>             
  </div> 
</template>
<script>
import Util from '../components/mixins/Util.js'

export default {
  props: {  
    list: String
  },
  data () {
      return {
        list_navegation: []
      }
  },
  mounted () {
    switch (this.list) {
      case 'accredit_request': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/request/user',
              label  : 'solicitudes'
          },
          {
              current: true,
              to     : false,
              label  : 'acreditación'
          }
        ];
      break;
      case 'create_request': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/request/user',
              label  : 'solicitudes'
          },
          {
              current: true,
              to     : false,
              label  : 'crear'
          }
        ];
      break;
      case 'edit_request': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/request/user',
              label  : 'solicitudes'
          },
          {
              current: true,
              to     : false,
              label  : 'editar'
          }
        ];
      break;
      case 'see_request': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/request/user',
              label  : 'solicitudes'
          },
          {
              current: true,
              to     : false,
              label  : 'detalle'
          }
        ];
      break;
      case 'index_request': 
        this.list_navegation = [           
          {
              current: true,
              to     : false,
              label  : 'solicitudes'
          }
        ];
      break;

      case 'request_manage_apply': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/request/manage',
              label  : 'gestión'
          },
          {
              current: true,
              to     : false,
              label  : 'gestonar solicitud'
          }
        ];
      break;
      case 'request_manage_edit': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/request/manage',
              label  : 'gestión'
          },
          {
              current: true,
              to     : false,
              label  : 'editar gestión'
          }
        ];
      break;
      case 'request_manage_accredit': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/request/manage',
              label  : 'gestión'
          },
          {
              current: true,
              to     : false,
              label  : 'acreditación'
          }
        ];
      break;
      case 'request_manage_index': 
        this.list_navegation = [           
          {
              current: true,
              to     : false,
              label  : 'gestión'
          }
        ];
      break;

      case 'request_approve_manage': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/request/approve',
              label  : 'análisis y aprobación'
          },
          {
              current: true,
              to     : false,
              label  : 'gestión'
          }
        ];
      break;
      case 'request_approve_see': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/request/approve',
              label  : 'análisis y aprobación'
          },
          {
              current: true,
              to     : false,
              label  : 'solicitud'
          }
        ];
      break;
      case 'request_approve_index': 
        this.list_navegation = [           
          {
              current: true,
              to     : false,
              label  : 'análisis y aprobación'
          }
        ];
      break;

      case 'catalogue_create': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/catalogue',
              label  : 'banco de tarifas'
          },
          {
              current: true,
              to     : false,
              label  : 'nuevo'
          }
        ];
      break;
      case 'catalogue_edit': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/catalogue',
              label  : 'banco de tarifas'
          },
          {
              current: true,
              to     : false,
              label  : 'editar'
          }
        ];
      break;
      case 'catalogue_rates': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/catalogue',
              label  : 'banco de empresas'
          },
          {
              current: true,
              to     : false,
              label  : 'tarifas'
          }
        ];
      break;
      case 'catalogue_rates': 
        this.list_navegation = [           
          {
              current: true,
              to     : false,
              label  : 'banco de tarifas'
          }
        ];
      break;


      case 'types_create': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/types',
              label  : 'tipos'
          },
          {
              current: true,
              to     : false,
              label  : 'nuevo'
          }
        ];
      break;
      case 'types_edit': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/types',
              label  : 'tipos'
          },
          {
              current: true,
              to     : false,
              label  : 'editar'
          }
        ];
      break;      
      case 'types_index': 
        this.list_navegation = [           
          {
              current: true,
              to     : false,
              label  : 'tipos'
          }
        ];
      break;

      case 'users_create': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/users',
              label  : 'usuarios'
          },
          {
              current: true,
              to     : false,
              label  : 'nuevo'
          }
        ];
      break;
      case 'users_edit': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/users',
              label  : 'usuarios'
          },
          {
              current: true,
              to     : false,
              label  : 'editar'
          }
        ];
      break;      
      case 'users_index': 
        this.list_navegation = [           
          {
              current: true,
              to     : false,
              label  : 'usuarios'
          }
        ];
      break;

      case 'viatics_create': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/viatics',
              label  : 'viáticos'
          },
          {
              current: true,
              to     : false,
              label  : 'nuevo'
          }
        ];
      break;
      case 'viatics_edit': 
        this.list_navegation = [           
          {
              current: false,
              to     : '/viatics',
              label  : 'viáticos'
          },
          {
              current: true,
              to     : false,
              label  : 'editar'
          }
        ];
      break;      
      case 'viatics_index': 
        this.list_navegation = [           
          {
              current: true,
              to     : false,
              label  : 'banco de viáticos'
          }
        ];
      break;
      case 'catalogue_index': 
        this.list_navegation = [           
          {
              current: true,
              to     : false,
              label  : 'banco de empresas'
          }
        ];
      break;


    }
  },
  methods: {
    
  }
}
</script>

<style>
  .navegation-list {
    margin: 5px 0px 15px 0px;
  }
</style>