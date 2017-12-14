<template>
  <div id="app">
    User index
    <div>
      {{ users }}
    </div>
  </div>
</template>

<script>
  export default {
    data: function(){
      return {
        users: []
      }
    },

    mounted: function (){
      var self = this;

      $.ajax({
        url: "/users",
        dataType: "json",
        method: "GET",
        error: function(xhr, status, error){
          console.log('AJAX error');
        },
        success: function(response){
          self.users = response;
        }
      })
    }
  }
</script>
