import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name", "output", "menu"]

  connect() {
    console.log("hamburger controller connected!")
    // 初期状態ではメニューを非表示に
    if (this.hasMenuTarget) {
      this.menuTarget.classList.add("hidden")
    }
  }

  greet() {
    this.outputTarget.textContent = `こんにちは、${this.nameTarget.value}さん!`
  }
  
  toggleMenu() {
    // メニューの表示/非表示を切り替え
    this.menuTarget.classList.toggle("hidden")
  }
}