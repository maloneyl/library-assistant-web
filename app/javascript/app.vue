<template>
  <div id="app" class="site">
    <header>
      <h1>GxIL</h1>
    </header>

    <section class="menu" :class="{ reveal: showNav }">
      <button class="trigger" @click="toggleNav">Menu</button>

      <main-nav />
    </section>

    <main>
      <template v-if="this.loading || this.hasErrors">
        <loader v-if="this.loading" />
        <div v-if="this.hasErrors"><p>😳😅</p></div>
      </template>
      <template v-else>
        <books v-if="this.hasBooks" :books="books" />
        <div v-else><p>There are no books. 😞</p></div>
      </template>
    </main>

    <footer>
      <main-footer />
    </footer>
  </div>
</template>

<script>
  import Loader from './components/loader.vue';
  import MainNav from './components/main-nav.vue';
  import MainFooter from './components/main-footer.vue';
  import Books from './components/books.vue';
  import axios from 'axios';

  export default {
    components: { Books, Loader, MainNav, MainFooter },
    data() {
      return {
        loading: false,
        books: [],
        errors: [],
        showNav: false
      }
    },
    created() {
      this.fetchData();
    },
    computed: {
      hasErrors() {
        return this.errors.length > 0
      },
      hasBooks() {
        return this.books.length > 0
      }
    },
    methods: {
      fetchData() {
        this.loading = true;

        axios.get('/books')
          .then(({data}) => this.books = data)
          .catch(error => this.errors.push(error))
          .then(() => this.loading = false)
      },
      toggleNav() {
        this.showNav = !this.showNav
      }
    }
  }
</script>

<style lang="scss" scoped>
  .site {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    background: hsl(0, 0%, 95%);
    font-family: 'Merriweather', serif;
  }

  header {
    font-family: 'Pacifico', cursive;
    padding: 1em;
    margin-bottom: 0.5em;
    border-bottom: 1px solid hsl(0, 0%, 80%);
    text-align: center;

    h1 {
      margin: 0;
    }
  }

  main {
    flex: 1;
    text-align: center;
  }

  footer {
    margin-top: 0.5em;
  }

  .menu {
    display: none;
  }

  @supports (grid-area: auto) {
    @media only screen and (min-width: 60em) {
      .site {
        display: grid;
        grid-template-areas:
          "header header header"
          "main main main"
          "footer footer footer"
      }

      header {
        grid-area: header;
        margin-bottom: 0;
      }

      main {
        grid-area: main;
      }

      .menu, .trigger {
        background: hsl(0, 0%, 10%);
        color: #fff;
        font-family: 'Lato', serif;
      }

      .menu {
        display: block;
        position: relative;
        grid-column: 1;
        grid-row: 1 / 4;
        width: 15em;
        left: -13em;
        font-size: 0.8em;
        padding-top: 1em;

        .trigger {
          font-size: 0.6em;
          transform: rotate(90deg);
          border: none;
          padding: 0.5em;
          font-size: 1em;
          position: fixed;
          top: 1.5em;
          left: 1em;
        }

        &.reveal {
          left: 0;

          .trigger {
            left: 14em;
          }

          .main-nav {
            position: fixed;
          }
        }
      }

      footer {
        grid-area: footer;
        margin-top: 0;
      }
    }
  }
</style>
