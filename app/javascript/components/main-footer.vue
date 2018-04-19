<template>
  <div class="footer">
    <div class="rule">
      <div class="before"></div>
      <div class="text">fin.</div>
      <div class="after"></div>
    </div>
    <p class="quote">
      &ldquo;{{ this.quote.body }}&rdquo;
      <span class="author">&mdash; {{ this.quote.author }}</span>
    </p>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        quote: {
          body: 'I wish you way more than luck.',
          author: 'David Foster Wallace'
        }
      }
    }
  }
</script>

<style lang="scss" scoped>
  .footer {
    padding: 1em;
    color: hsl(0, 0%, 40%);
    text-align: center;
    font-style: italic;

    .rule {
      display: flex;
      justify-content: center;
      margin-bottom: 1.5em;

      .text {
        font-family: 'Pacifico', cursive;
        font-size: 1.5em;
        margin: 0 5px;
      }

      .before, .after {
        position: relative;
        top: 0.75em;
        width: 15%;
        min-width: 100px;
        border-top: 1px solid hsl(0, 0%, 70%);
      }
    }

    .quote {
      font-size: 0.7em;
      margin-top: 1em;

      .author {
        display: block;
      }
    }
  }

  @media only screen and (min-width: 650px) {
    .footer .quote .author {
      display: inline;
    }
  }
</style>
