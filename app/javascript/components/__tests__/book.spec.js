import { shallow } from '@vue/test-utils'
import Book from '@/components/book.vue'

describe('Book', () => {
  describe('hasBookCover', () => {
    it('uses the book cover image if a proper one is available', () => {
      const wrapper = shallow(Book, {
        propsData: {
          book: {
            image_url: 'https://images.gr-assets.com/books/1487215696l/29214420.jpg'
          }
        }
      })

      expect(wrapper.vm.hasBookCover).toEqual(true)
    })

    it('does not consider the Goodreads no-book image to be available', () => {
      const wrapper = shallow(Book, {
        propsData: {
          book: {
            image_url: 'https://s.gr-assets.com/assets/nophoto/book/111x148-bcc042a9c91a29c1d680899eff700a03.png'
          }
        }
      })

      expect(wrapper.vm.hasBookCover).toEqual(false)
    })
  })
})
