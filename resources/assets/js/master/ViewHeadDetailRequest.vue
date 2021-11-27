<template>
  <div>
    <span class="span-title">Detalle de la solicitud</span>

    <div v-if="request.id == id_request" class="grid-data-request">
      <div class="grid-data-request-div1">
          <table class="table-detail-request">
            <tbody class="">
              <tr class="">
                <td class=""><span class="span-title">Estado:</span></td>
                <td class=""><span>{{ request.code.label }}</span></td>
              </tr>
              <tr class="">
                <td class=""><span class="span-title">Fecha creación:</span></td>
                <td class=""><span>{{ request.created_at | dateTimeInverted}}</span></td>
              </tr>
              <tr class="">
                <td class=""><span class="span-title">Ultima actualización:</span></td>
                <td class=""><span>{{ request.updated_at | dateTimeInverted}}</span></td>
              </tr>
            </tbody>
          </table>           
      </div>
      <div class="grid-data-request-div2">
        <table class="table-detail-request">
          <tbody class="">
            <tr class="">
              <td class=""><span class="span-title">Folio:</span></td>
              <td class=""><span>{{ request.folio }}</span></td>
            </tr>
            <tr class="">
              <td class=""><span class="span-title">Fecha:</span></td>
              <td class=""><span>{{ request.going_at | dateInverted}} ~ {{ request.return_at | dateInverted}}</span></td>
            </tr>
            <tr class="">
              <td class=""><span class="span-title">Colaboradores:</span></td>
              <td class=""><span> <i class="mdi mdi-eye hover-cursor icon-see" @click="showModal('staff')"></i><span class="">{{ request.users.length }}</span></span></td>
            </tr>
              <tr class="">
              <td class=""><span class="span-title">Proyectos:</span></td>
              <td class=""><span><i class="mdi mdi-eye hover-cursor icon-see" @click="showModal('projects')"></i><span class="">{{ request.projects.length }}</span></span></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="grid-data-request-div3">
        <table class="table-detail-request">
          <tbody class="">
              <tr class="">
                <td class=""><span class="span-title">Responsable Solicitud:</span></td>
                <td class=""><span v-if="request.user">{{ request.user.name | upper }}</span></td>
              </tr>
              <tr class="">
                <td class=""><span class="span-title">Responsable Gestión:</span></td>
                <td class=""><span v-if="request.user_management">{{ request.user_management.name | upper  }}</span></td>
              </tr>
              <tr class="">
                <td class=""><span class="span-title">Responsable Aprobación:</span></td>
                <td class=""><span v-if="request.user_approve">{{ request.user_approve.name | upper  }}</span></td>
              </tr>
            </tbody>
          </table>       
      </div>
      <div class="grid-data-request-div4">       
        <table class="table-detail-request">
          <tbody class="">  
              <tr class="">
                <td class="span-title">Destino:</td>
                <td class="span-destiny">{{ request.commune.region.name }}, {{ request.commune.name }}, {{ request.destiny }}</td>
              </tr>           
              <tr class="">
                <td class="span-title">Descripción:</td>
                <td class="span-description"><div class="">{{ request.description }}</div></td>
              </tr>
            </tbody>
          </table>  
      </div>
      <div class="grid-data-request-div5">
        <table class="table-detail-request">
          <tbody class="">
            <tr class="">
              <td class=""><span class="span-title">Monto Gestión:</span></td>
              <td class=""><span>{{ total_manage_request | currency }}</span></td>
            </tr>
            <tr class="">
              <td class=""><span class="span-title">Monto Efectivo:</span></td>
              <td class=""><span>{{ request.cash | currency }}</span></td>
            </tr>   
            <tr class="">
              <td class=""><span class="span-title">Total Solicitud:</span></td>
              <td class=""><span>{{ parseInt(request.cash) + parseInt(total_manage_request) | currency }}</span></td>
            </tr>     
            <tr class="">
              <td class=""><span class="span-title">Total Acreditado:</span></td>
              <td class="td-span-total-acreditado"><span :title="'Total acreditado: '+total_accredit +' + Total de la gestión: '+total_manage_request">{{ total_accredit + total_manage_request | currency }}</span></td>
            </tr>
            <tr class="">
              <td class=""><span class="span-title">Diferencia:</span></td>
              <td class=""><span>{{ parseInt(request.cash) - parseInt(total_accredit) | currency }}</span></td>
            </tr>          
          </tbody>
        </table>   
      </div>
      <modal-list></modal-list>  
    </div>      
  </div>      
</template>

<script>
import Util from '../components/mixins/Util.js'
import {mapState, mapMutations, mapActions} from "vuex"
export default {
  mixins: [Util],
  props: {  
    id_request: Number,
  }, 
  created () {   
    this.getRequest(this.id_request)  
  },
   methods: {
    ...mapMutations(['setRequest', 'setTotalManageRequest', 'setTotalAccredit']),
    ...mapActions(['getRequest'])    
  },
  computed:{
    ...mapState(['request', 'total_manage_request', 'total_accredit'])
  }  
}
</script>

<style>
.span-description {  
  text-align: justify;
  text-justify: inter-word;
}
.table-detail-request tbody tr td{
  padding-top: 0px!important;
  padding-bottom: 1px!important;
}

.grid-data-request {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: 0,7fr 1fr ;
  grid-column-gap: 0px;
  grid-row-gap: 0px;
}

.grid-data-request-div1 { grid-area: 1 / 1 / 2 / 2; }
.grid-data-request-div2 { grid-area: 1 / 2 / 2 / 3; }
.grid-data-request-div3 { grid-area: 1 / 3 / 2 / 4; }
.grid-data-request-div4 { grid-area: 2 / 1 / 3 / 3; padding-top: 15px;}
.grid-data-request-div5 { grid-area: 2 / 3 / 3 / 4; }
.simple-root {
	margin-top   : 20%;
	margin-left  : auto;
	margin-right : auto;

}
.td-span-total-acreditado{
  cursor: pointer;
}
</style>