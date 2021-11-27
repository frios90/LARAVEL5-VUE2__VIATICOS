<template>
  <div v-if="request.id">
    <div v-if="request.request_payment.length > 0">
      <span class="span-title">Detalle de lo acreditado</span>
      <table class="table table-sm table-bordered">
        <thead>
            <tr>
                <th>Fecha</th>
                <th>Número</th>
                <th>Empresa</th>
                <th>Rut</th>                
                <th>Descripción</th>
                <th>Monto</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(pay, key) in request.request_payment" :key="key">
                <td class="detail-rates-table-td"> {{ pay.emited_at }}</td>
                <td class="detail-rates-table-td"> {{ pay.number }}</td>
                <td class="detail-rates-table-td"> {{ pay.name_company }}</td>
                <td class="detail-rates-table-td"> {{ pay.rut_company }}</td>
                <td class="detail-rates-table-td"> {{ pay.description }}</td>
                <td class="detail-currency-right"> {{ pay.amount | currency }}</td>
            </tr>
        </tbody>
     </table>
    </div>
    <div v-else>
      <span class="span-title">Aún no existe acreditación de tarifas sobre esta solicitud</span>
    </div>
    <div v-if="request.accredit_documents.length > 0" class="grid-picture-div1">
      <viewer :options="viewer_options" :images="format_img_docs(request.accredit_documents)">
          <img v-for="src in format_img_docs(request.accredit_documents)" :src="src" :key="src" width="100" height="80" />
      </viewer>
    </div> 
    <div v-else>
      <span class="span-title">No hay imagenes adjuntas que acrediten lo ingresado.</span>
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
  data() {
    return {
      viewer_options : {
        toolbar: false
      },        
    }
  },
  mounted () {   
    this.getRequest(this.id_request)  
  },
  methods: {
    format_img_docs (docs) {
        var array_docs = []
        docs.forEach(function (val, index) {
            console.log('aqui es donde se puede realizar esta cuestion')
            console.log(val)
            array_docs.push(val.path)
        })
        return array_docs
    },
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