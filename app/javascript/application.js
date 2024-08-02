// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"
import "trix"
import "@rails/actiontext"

(function () {
  'use strict';

  // Função para adicionar o listener ao botão de colapsar
  function initializeNavbar() {
    const navbarCollapse = document.querySelector('#navbarSideCollapse');
    if (navbarCollapse) {
      navbarCollapse.addEventListener('click', () => {
        document.querySelector('.offcanvas-collapse').classList.toggle('open');
      });
    }
  }

  // Função para adicionar o listener ao input de resumo
  function initializeSummaryCounter() {
    const summaryInput = document.getElementById('summary-input');
    const currentCount = document.getElementById('current');
    const maximumCount = document.getElementById('maximum');

    if (summaryInput && currentCount && maximumCount) {
      const updateCount = () => {
        currentCount.textContent = summaryInput.value.length;
      };
      
      summaryInput.addEventListener('input', updateCount);
      updateCount();  // Inicializa o contador
    } else {
      console.error("Elementos não encontrados:", { summaryInput, currentCount, maximumCount });
    }
  }

  // Inicializa as funções quando o DOM estiver completamente carregado ou Turbo Drive realizar a navegação
  function init() {
    initializeNavbar();
    initializeSummaryCounter();
  }

  document.addEventListener('DOMContentLoaded', init);
  document.addEventListener('turbo:load', init);
})();
