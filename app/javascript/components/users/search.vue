<template>
  <div id="search-box">
    <input type="text" v-model="search" v-on:keyup="searchUser"/>
  </div>
</template>

<script>
  export default {
    data: function() {
      return {
        search: ''
      }
    },
    methods: {
      searchUser(){
        this.$emit('search-user', this.search)
      }
    }
  }
</script>
