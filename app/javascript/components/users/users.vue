<template>
  <div id="app">
    User index
    {{ message }}
    <div class="text-danger">
      Hello there
    </div>
  </div>
</template>

<script>
  export default {
    data: function(){
      return {
        message: "Hello world"
      }
    },
    mounted: function(){
      $.ajax({
        url: "/users",
        dataType: "json",
        method: "GET",
        error: function(xhr, status, error){
          console.log('AJAX error');
        },
        success: function(response){
          console.log(response)
        }
      })
    }
  }
</script>
