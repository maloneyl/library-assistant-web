<template>
  <section class="books">
    <div class="no-books" v-if="this.bookCount === 0">
      There are no books. 😞
    </div>
    <template v-else>
      <div class="description">
        <span class="emoji">💁🏻‍♀️💁🏽‍♂️</span>
        The library has <strong>{{ this.bookCount }}</strong> of your recently added to-read books.
        <div class="sort-controls">
          <button @click="this.sortByRatingDesc">Highest rated first</button>
          <button @click="this.sortByYearDesc">Most recently published first</button>
        </div>
      </div>
      <book :bookObj="book" v-for="book in books" :key="book.isbn" />
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
      bookCount () {
        return this.books.length
      }
    },
    methods: {
      sortByRatingDesc() {
        return this.books.sort((a, b) => b.average_rating - a.average_rating)
      },
      sortByYearDesc() {
        return this.books.sort((a, b) => b.year - a.year)
      }
    }
  }
</script>

<style lang="scss" scoped>
  .books {
    display: grid;
    grid-template-columns: 100%;
    grid-template-rows: auto;
    grid-gap: 1em;
    justify-items: center;
    align-items: center;
    padding: 3em 0;

    .description {
      padding: 0 2em 1em 2em;
      font-family: 'Lato', sans-serif;
      text-align: center;
    }

    .sort-controls button {
      margin: 0.5em 0.3em 0 0.3em;
      font-family: inherit;
      font-size: 0.8em;

      &:hover {
        cursor: pointer;
      }
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

  @media only screen and (min-width: 65em) {
    .books {
      grid-template-columns: 1fr 1fr 1fr;

      .description {
        grid-column: 1 / span 1;
        text-align: right;
        align-self: start;

        .emoji {
          display: block;
        }
      }
    }

    .no-books {
      grid-column: 1 / span 3;
    }
  }
</style>
