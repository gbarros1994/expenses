<template>
<div class="container">
  <form @submit.prevent="doLogin()">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input v-model="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input v-model="senha" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary text-bold">Entrar</button>
</form>
</div>
</template>

<script>
export default {
  name: 'Aplicacao',
  data: () => {
    return {
      email: '',
      senha: ''
    }
  },

  methods: {
    async doLogin() {
      try{
        const res = await this.$firebase.auth().signInWithEmailAndPassword(this.email, this.senha)
        window.uid = res.user.uid

        this.$router.push({ name: 'home'})
        console.log(res)
      } catch {
        console.log('deu merda!')
      }
    }
  }
}
</script>


<style lang="scss" scoped>

</style>