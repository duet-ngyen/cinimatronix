<template>
  <div class="user-item">
    <div class="content">
      {{ user.name }} - {{ user.email }}
      <button v-on:click="editUser" v-if="!isEditing">Edit</button>
      <button v-on:click="delUser(user)">Del</button>
    </div>

    <div class="content" v-if="isEditing">
      <div class="field">
        <span>User Name</span>
        <input type="text" v-model="user.name" v-bind:class="{'input-error': hasError}"/>
      </div>
      <div class="field">
        <span>Email</span>
        <input type="text" v-model="user.email"/>
      </div>
      <div class="field action">
        <button v-on:click="updateUser(user)">Save</button>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['user'],
    data() {
      return {
        isEditing: false,
        hasError: false
      }
    },
    methods: {
      editUser: function(){
        this.isEditing = true
      },
      updateUser(user){
        var self = this;

        $.ajax({
          url: "/users/" + user.id,
          type: "json",
          method: "PUT",
          data: {user: user},
          error: function(xhr, status, error){
            console.log('AJAX error');
          },
          success: function(response){
            if(response["updated_user"] == true) {
              self.isEditing = false;
              console.log(response);
            } else {
              self.isEditing = true;
              self.hasError = true;
              console.log(response);
            }
          }
        })
      },
      delUser(user){
        var self = this;

        $.ajax({
          url: "/users/" + user.id,
          type: "json",
          method: "DELETE",
          data: {user: user},
          error: function(xhr, status, error){
            console.log('AJAX error');
          },
          success: function(response){
            if(response["destroyed_user"]) {
              self.$emit('del-user', user);
            } else {
              console.error("Cannot destroy user")
            }
          }
        });
      }
    }
  }
</script>
