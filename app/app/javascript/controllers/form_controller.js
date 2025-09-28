import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["submit", "errors"]

  // Обработка отправки формы
  async submitForm(event) {
    event.preventDefault()

    try {
      const form = this.element
      const formData = new FormData(form)

      // Блокируем кнопку
      this.submitTarget.disabled = true
      this.submitTarget.value = "Отправка..."

      const response = await fetch(form.action, {
        method: form.method,
        body: formData,
        headers: {
          'Accept': 'application/json',
        }
      })

      const result = await response.json()

      if (response.ok) {
        window.location.href = result.location
      } else {
        this.showErrors(result)
      }
    } catch (error) {
      this.showErrors({ error: ["Ошибка соединения. Проверьте интернет и попробуйте снова."] })
    } finally {
      this.restoreSubmitButton()
    }
  }

  showErrors(errors) {
    const errorMessages = Object.values(errors).flat()

    if (this.hasErrorsTarget) {
      this.errorsTarget.innerHTML = `
        <div class="alert alert-danger">
          <h4>${errorMessages.length} error(s):</h4>
          <ul class="mb-0">
            ${errorMessages.map(msg => `<li>${msg}</li>`).join('')}
          </ul>
        </div>
      `

      // Автоскрытие через 5 секунд
      setTimeout(() => {
        this.errorsTarget.innerHTML = ''
      }, 5000)
    }
  }

  restoreSubmitButton() {
    if (this.hasSubmitTarget) {
      this.submitTarget.disabled = false
      this.submitTarget.value = "Отправить"
    }
  }
}
