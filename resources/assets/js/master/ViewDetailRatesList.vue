<template>
  <div v-if="request.id">
    <div v-if="request.rates.length > 0">
      <span class="span-title">Detalle de las Tarifas asignadas</span>
      <table class="table table-sm table-bordered">
        <thead>
            <tr>
                <th>Tipo</th>
                <th>Viático</th>
                <th>Empresa</th>
                <th>Tarifa</th>                
                <th>Cantidad Solicitada</th>
                <th>Valor Único</th>
                <th>Valor Total</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(rate, key) in request.rates" :key="key">
                <td class="detail-rates-table-td"> {{ rate.management.code.type.label }}</td>
                <td class="detail-rates-table-td"> {{ rate.management.code.label }}</td>
                <td class="detail-rates-table-td"> {{ rate.management.name }}</td>
                <td class="detail-rates-table-td"> {{ rate.description }}</td>
                <td class="detail-currency-right"> {{ rate.pivot.qty }}</td>
                <td class="detail-currency-right"> {{ rate.value | currency }}</td>
                <td class="detail-currency-right"> {{ rate.pivot.value | currency }}</td>
            </tr>
        </tbody>
     </table>
    </div>
    <div v-else>
      <span class="span-title">Aún no existe gestión de tarifas sobre esta solicitud</span>
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
  mounted () {   
    this.getRequest(this.id_request)  
  },
  methods: {
    ...mapMutations(['setRequest', 'setTotalManageRequest']),
    ...mapActions(['getRequest'])    
  },
  computed:{
    ...mapState(['request', 'total_manage_request'])
  }  
}
</script>

<style>

.span-title {
  font-weight: bold;
  font-size: 12px;
  color: #004b48!important;
}
th {  
  background-color: #004b48!important;
}
</style>