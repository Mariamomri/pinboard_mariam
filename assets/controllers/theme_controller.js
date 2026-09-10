import { Controller } from "@hotwired/stimulus";

// Contrôleur pour basculer entre thème nuit (défaut) et thème jour
export default class extends Controller {
    static targets = ["icon"];

    connect() {
        const savedTheme = localStorage.getItem("theme") || "dark";
        this.applyTheme(savedTheme);
    }

    toggle() {
        const current =
            document.documentElement.getAttribute("data-theme") || "dark";
        const next = current === "dark" ? "light" : "dark";
        this.applyTheme(next);
        localStorage.setItem("theme", next);
    }

    applyTheme(theme) {
        if (theme === "light") {
            document.documentElement.setAttribute("data-theme", "light");
        } else {
            document.documentElement.removeAttribute("data-theme");
        }
        if (this.hasIconTarget) {
            this.iconTarget.textContent = theme === "light" ? "🌙" : "☀️";
        }
    }
}
