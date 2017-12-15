<template>
  <div id="app">
    User index
    <div>
      <Search v-on:search-user="searchUser"/>
    </div>
    <div v-for="user in users">
      <User v-bind:user="user"/>
    </div>
  </div>
</template>

<script>
  import User from './user.vue';
  import Search from './search.vue';

  export default {
    components: {
      User,
      Search
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
    },

    methods: {
      searchUser(val){
        var self = this;

        $.ajax({
          url: "/users",
          dataType: "json",
          method: "GET",
          data: { search_value: val },
          error: function(xhr, status, error){
            console.log('AJAX error');
          },
          success: function(response){
            self.users = response;
          }
        })
      }
    }
  }
</script>
