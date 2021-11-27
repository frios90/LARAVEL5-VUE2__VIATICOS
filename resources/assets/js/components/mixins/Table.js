export default {
    data () {
        return {
            loader: false,
            columns   : [],
            tableData : [],
            options: {
                headings          : {},
                sortable          : [],
                texts             : {
                count             :"Mostrando registros del {from} al {to} de un total de {count}|{count} registros| Un registro",
                first             : "Primera",
                last              : "Última",
                filter            : "",
                filterPlaceholder : "",
                limit             : "",
                page              : "Página:",
                noResults         : "No se encontraron resultados",
                filterBy          : "Filtrar tabla",
                loading           : "Cargando información",
                defaultOption     : "Seleccionar {column}",
                columns           : "Columnas"
                }
            }
        }
    },  
    methods: {
        getDataTable(url, params_data){   
            var self = this  
            this.$http.get(url, {params : params_data}).then(function(response){
                self.tableData = response.body
                console.log('luego de esto deberia esta sacando el loader')
                self.loader = false
                }, function(){
                    alert('Error!');
                })            
        },
           
    }
}