<template>
  <section class="books">
    <div class="no-books" v-if="this.book_count === 0">
      There are no books. 😞
    </div>
    <template v-else>
      <div class="description">
        <span class="emoji">💁🏻‍♀️💁🏽‍♂️</span>
        The library has <strong>{{ this.book_count }}</strong> of your recently added to-read books:
      </div>
      <book :bookObj="book" v-for="book in books" />
    </template>
  </section>
</template>

<script>
  import Book from './book.vue';

  export default {
    props: {
      books: {
        type: Array,
        default: () => []
      }
    },
    components: { Book },
    computed: {
      book_count () {
        return this.books.length
      }
    }
  }
</script>

<style lang="scss" scoped>
  .books {
    display: grid;
    grid-template-columns: 100%;
    grid-template-rows: auto;
    justify-items: center;
    align-items: center;
    padding-top: 3em;

    .description {
      padding: 0 2em 2em 2em;
      font-family: 'Lato', sans-serif;
    }

    .no-books {
      margin-top: 20vh;
    }
  }

  @media only screen and (min-width: 40em) {
    .books {
      grid-template-columns: 1fr 1fr;
    }

    .no-books {
      grid-column: 1 / span 2;
    }

    .description {
      padding-left: 2em;
      grid-column: 1 / span 2;
    }
  }

  @media only screen and (min-width: 55em) {
    .books {
      grid-template-columns: 1fr 1fr 1fr;
    }

    .no-books {
      grid-column: 1 / span 3;
    }

    .description {
      grid-column: 1 / span 1;
      text-align: right;
      align-self: start;

      .emoji {
        display: block;
      }
    }
  }
</style>
