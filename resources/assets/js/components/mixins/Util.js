
export default { 
    data () {
        return {
            csrf         : document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            loader       : true,
            id           : parseInt(this.$route.params.id),               
            errors       : {},
            region_list  : {},
            region       : 0,
            commune_list : {},
            commune      : 0
        }
    },
    created () {
       
    },
    methods: {                
        changeStatus (id, url, _return) {
          event.preventDefault()
          var data = {
            _token: this.csrf,
              id: id            
            }
          var self = this  
          this.$http.post(url, data)
          .then(response => {
             this.getDataTable(_return)
              self.$toasted.global.APP_GENERAL_SUCCESS()
            }, response => {                 
               self.$toasted.global.APP_GENERAL_ERROR()
            })
        },
        showModal (value) {
            event.preventDefault()
            var data = {}
            if (value === 'staff') {
                data = this.request.users
            }
            if (value === 'projects') {
                data = this.request.projects
            }
            if (value === 'description') {
                data = this.request.description
            }
            this.$modal.show('list', { list: value, dts: data});
        },
        hideModal () {
            this.$modal.hide('list');
        },
        getRegions() {
            var self = this
            this.$http.get('/region-list').then(function(response) {
                self.region_list = response.body
            }, function() {
                alert('Error!');
            })
        },
        getCommunes() {
            var self = this
            this.$http.get('/commune-list', {
                params: {
                    region: self.region
                }
            }).then(function(response) {
                self.commune_list = response.body
            }, function() {
                alert('Error!');
            })
        },

    },
    filters: {
        upper (string) {
            var string =  string.toLowerCase()
            return string.replace(/\b\w/g, l => l.toUpperCase())
        },
        dateInverted: function (date) {
            var date = date.substr(0,10)               
            return date.replace(/^(\d{4})-(\d{2})-(\d{2})$/g,'$3-$2-$1')
        },
        dateTimeInverted: function (date) {
            
            var dateSplit = date.split(" ")
            date = dateSplit[0].substr(0,10)               
            return date.replace(/^(\d{4})-(\d{2})-(\d{2})$/g,'$3-$2-$1') + " " + dateSplit[1]
        },
        isNumber: function(evt) {
            evt = (evt) ? evt : window.event
            var charCode = (evt.which) ? evt.which : evt.keyCode
            if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
                evt.preventDefault()
            } else {
                return true;
            }
        }
    }
}