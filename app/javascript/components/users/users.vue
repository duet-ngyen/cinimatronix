<template>
  <div id="app">
    User index
    <div v-for="user in users">
      <User v-bind:user="user"/>
    </div>
  </div>
</template>

<script>
  import User from './user.vue';

  export default {
    components: {
      User
    },
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
