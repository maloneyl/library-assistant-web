<template>
  <div class="book">
    <a :href="book.link" target="_blank">
      <figure class="cover">
        <img v-if="this.hasBookCover" :src="book.image_url" :alt="this.bookCoverAltText" />
        <div v-else class="text-cover">
          <h5>{{ this.book.title }}</h5>
          <h6>{{ this.book.author}}</h6>
        </div>
      </figure>
      <div class="info">
        <div class="index">{{ index | humanizeIndex }}</div>
        <div class="details">
          <div class="average-rating">
            <star-rating :rating="book.average_rating" />
            <div>{{ book.average_rating }}</div>
          </div>
          <div class="year">[{{ book.year }}]</div>
        </div>
      </div>
    </a>
  </div>
</template>

<script>
  import StarRating from './star-rating.vue';

  export default {
    props: {
      book: { type: Object },
      index: { type: Number }
    },
    components: { StarRating },
    computed: {
      bookCoverAltText() {
        return `${this.book.title} | ${this.book.author}`
      },
      hasBookCover() {
        return !this.book.image_url.match('/nophoto/')
      }
    },
    filters: {
      humanizeIndex(index) {
        return index + 1
      }
    }
  }
</script>

<style lang="scss" scoped>
  .book {
    background: hsl(360, 100%, 100%);
    border: 1px solid hsl(0, 0%, 80%);
    margin-bottom: 15px;
    height: 240px;
    width: 300px;

    &:hover {
      box-shadow: 3px 3px 8px hsl(0, 0%, 70%);
    }

    a {
      text-decoration: none;
      color: initial;
      width: 100%;
      height: 100%;
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;

      figure {
        margin: 15px;

        img, .text-cover {
          height: 215px;
          max-width: 150px;
          border: 1px solid hsl(0, 0%, 90%);
        }

        .text-cover {
          background: hsl(0, 0%, 20%);
          color: hsl(360, 100%, 100%);
          padding: 5px;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          font-family: 'Merriweather', serif;

          h5, h6 {
            margin: 5px 0;
          }
        }
      }

      .info {
        height: 100%;
        margin: 0;
        position: relative;

        .index {
          background: hsl(0, 0%, 0%);
          color: hsl(360, 100%, 100%);
          width: 2em;
          height: 2em;
          font-size: 0.8em;
          padding: 0.5em;
          line-height: 1.1;
          position: absolute;
          right: 1em;

          &:after {
            content: '';
            position: absolute;
            width: 0;
            height: 0;
            top: 2em;
            right: 0;
            border-left: 1em solid transparent;
            border-right: 1em solid transparent;
            border-top: 1em solid hsl(0, 0%, 0%);
          }
        }

        .details {
          display: flex;
          flex-direction: column;
          height: 100%;
          justify-content: center;
          padding: 1em;
          font-family: 'Merriweather', serif;
          font-size: 0.8em;
          color: hsl(0, 0%, 40%);
          text-align: right;
        }
      }
    }
  }

  @media only screen and (min-width: 650px) {
    .book {
      margin: 10px;
    }
  }
</style>
