<template>
  <div id="app">
    <b-navbar type="is-primary">
      <template slot="brand"> 
        <b-navbar-item tag="router-link" :to="{path:'/'}">
          <h1>Lexici</h1>
        </b-navbar-item>
      </template>
      <template slot="start">
        <b-navbar-dropdown :label="program">
          <b-navbar-item v-for="prog in $store.state.programs" v-bind:active="prog === program">{{ prog }}</b-navbar-item>
        </b-navbar-dropdown>
        <b-navbar-dropdown :label="langA" hoverable>
          <b-navbar-item v-for="lang in $store.state.languages" v-bind:active="lang === langA" v-on:click="setLangA">{{ lang }}</b-navbar-item>
        </b-navbar-dropdown>
        <b-navbar-dropdown :label="langB">
          <b-navbar-item v-for="lang in $store.state.languages" v-bind:active="lang === langB">{{ lang }}</b-navbar-item>
        </b-navbar-dropdown>
      </template>
      <template slot="end">
        <b-navbar-item tag="a" href="http://git.ardenrasmussen.com">
          <b-icon icon="github-circle"></b-icon>
        </b-navbar-item>
      </template>
    </b-navbar>
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      program: 'Euler 1',
      langA: 'Ada',
      langB: 'C++'
    }
  },
  methods: {
    setLangA() {
      console.log("SET LANG A");
    }
  }
}
</script>

<style lang="scss">
@import "~bulma/sass/utilities/_all";

$primary: $blue;
$primary-invert: findColorInvert($primary);

$colors: (
    "white": ($white, $black),
    "black": ($black, $white),
    "light": ($light, $light-invert),
    "dark": ($dark, $dark-invert),
    "primary": ($primary, $primary-invert),
    "info": ($info, $info-invert),
    "success": ($success, $success-invert),
    "warning": ($warning, $warning-invert),
    "danger": ($danger, $danger-invert),
);

// Links
$link: $primary;
$link-invert: $primary-invert;
$link-focus-border: $primary;

@import "~bulma";
@import "~buefy/src/scss/buefy";
</style>
