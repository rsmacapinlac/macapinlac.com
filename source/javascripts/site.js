// macapinlac.com — Build Log site script
// Handles: homepage log-feed search, article reading progress + TOC scroll-spy.

(function () {
  'use strict';

  function escapeHTML (s) {
    return s.replace(/[&<>"']/g, function (c) {
      return ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[c];
    });
  }

  // ---------------------------------------------------------------------------
  // Homepage: live filter over .ix-row entries
  // ---------------------------------------------------------------------------
  function initHomeSearch () {
    var input = document.getElementById('q');
    if (!input) return;

    var fakecur = document.getElementById('fakecur');
    var rows    = [].slice.call(document.querySelectorAll('.ix-row'));
    var latest  = document.getElementById('latestBlock');
    var series  = document.getElementById('seriesBlock');
    var stat    = document.getElementById('searchstat');
    var none    = document.getElementById('noresults');
    var form    = document.getElementById('searchForm');

    function syncCursor () {
      if (!fakecur) return;
      var idle = document.activeElement !== input && input.value === '';
      fakecur.style.display = idle ? 'inline-block' : 'none';
    }

    function run () {
      syncCursor();
      var raw = input.value.trim();
      var query = raw.toLowerCase();
      var active = query.length > 0;

      if (latest) latest.style.display = active ? 'none' : '';
      if (series) series.style.display = active ? 'none' : '';

      var matches = 0;
      rows.forEach(function (row) {
        var hit = !active || row.textContent.toLowerCase().indexOf(query) > -1;
        row.style.display = hit ? '' : 'none';
        if (hit && active) matches++;
      });

      if (stat) {
        if (active) {
          stat.classList.add('is-active');
          stat.innerHTML = 'grep <span class="qx">"' + escapeHTML(raw) + '"</span> ~/posts → ' +
            matches + ' match' + (matches === 1 ? '' : 'es');
        } else {
          stat.classList.remove('is-active');
        }
      }

      if (none) none.hidden = !(active && matches === 0);
    }

    ['focus', 'blur', 'input'].forEach(function (ev) { input.addEventListener(ev, run); });
    if (form) form.addEventListener('submit', function (e) { e.preventDefault(); });
    syncCursor();
  }

  // ---------------------------------------------------------------------------
  // Article: reading progress bar
  // ---------------------------------------------------------------------------
  function initProgress () {
    var bar = document.getElementById('prog');
    if (!bar) return;
    function update () {
      var html = document.documentElement;
      var scrolled = html.scrollTop || document.body.scrollTop;
      var max = html.scrollHeight - html.clientHeight;
      bar.style.width = (max > 0 ? (scrolled / max * 100) : 0) + '%';
    }
    window.addEventListener('scroll', update, { passive: true });
    window.addEventListener('resize', update, { passive: true });
    update();
  }

  // ---------------------------------------------------------------------------
  // Article: build TOC from headings in .body, then scroll-spy
  // ---------------------------------------------------------------------------
  function slugify (text) {
    return (text || '')
      .toLowerCase()
      .replace(/[^\w\s-]/g, '')
      .replace(/\s+/g, '-')
      .replace(/-+/g, '-')
      .replace(/^-|-$/g, '');
  }

  function initTOC () {
    var body = document.querySelector('.body');
    var railContainer   = document.querySelector('.toc-rail');
    var inlineContainer = document.querySelector('.toc-inline');
    if (!body || (!railContainer && !inlineContainer)) return;

    var headings = [].slice.call(body.querySelectorAll('h2, h3'));
    if (!headings.length) {
      if (railContainer)   railContainer.classList.add('is-empty');
      if (inlineContainer) inlineContainer.classList.add('is-empty');
      return;
    }

    var seen = {};
    var items = headings.map(function (h) {
      var id = h.id;
      if (!id) {
        var base = slugify(h.textContent);
        id = base || 'section';
        var n = 1;
        while (seen[id]) { n++; id = base + '-' + n; }
        h.id = id;
      }
      seen[id] = true;
      return { id: id, text: h.textContent.trim(), level: h.tagName.toLowerCase() };
    });

    function renderInto (container) {
      var ol = container.querySelector('ol');
      if (!ol) return;
      ol.innerHTML = items.map(function (it) {
        return '<li><a class="' + (it.level === 'h3' ? 'lvl3' : 'lvl2') +
          '" href="#' + it.id + '">' + escapeHTML(it.text) + '</a></li>';
      }).join('');
    }
    if (railContainer)   renderInto(railContainer);
    if (inlineContainer) renderInto(inlineContainer);

    var OFFSET = 96;
    var links = [].slice.call(document.querySelectorAll('.toc a'));

    links.forEach(function (a) {
      a.addEventListener('click', function (e) {
        e.preventDefault();
        var id = a.getAttribute('href').slice(1);
        var el = document.getElementById(id);
        if (!el) return;
        var y = el.getBoundingClientRect().top + (window.pageYOffset || document.documentElement.scrollTop) - OFFSET;
        window.scrollTo({ top: y, behavior: 'smooth' });
      });
    });

    function spy () {
      var pos = (window.pageYOffset || document.documentElement.scrollTop) + OFFSET + 8;
      var activeId = items[0].id;
      items.forEach(function (it) {
        var el = document.getElementById(it.id);
        if (el && el.offsetTop <= pos) activeId = it.id;
      });
      links.forEach(function (a) {
        a.classList.toggle('on', a.getAttribute('href') === '#' + activeId);
      });
    }
    window.addEventListener('scroll', spy, { passive: true });
    spy();
  }

  // ---------------------------------------------------------------------------
  // Archive: category filter chips
  // ---------------------------------------------------------------------------
  function initArchiveFilters () {
    var filters = document.querySelectorAll('.filters .fchip');
    if (!filters.length) return;
    var rows = [].slice.call(document.querySelectorAll('.arow'));

    filters.forEach(function (chip) {
      chip.addEventListener('click', function () {
        var slug = chip.getAttribute('data-cat') || 'all';
        filters.forEach(function (c) { c.classList.toggle('on', c === chip); });

        var visibleYears = {};
        rows.forEach(function (row) {
          var rowCat = row.getAttribute('data-cat') || '';
          var match = slug === 'all' || rowCat === slug;
          row.style.display = match ? '' : 'none';
          if (match) {
            var year = row.getAttribute('data-year');
            if (year) visibleYears[year] = true;
          }
        });

        document.querySelectorAll('.yeargroup').forEach(function (g) {
          var y = g.getAttribute('data-year');
          g.style.display = (slug === 'all' || visibleYears[y]) ? '' : 'none';
        });
      });
    });
  }

  // ---------------------------------------------------------------------------
  // Card click handling (legacy compatibility for any remaining .card[data-url])
  // ---------------------------------------------------------------------------
  function initCardClicks () {
    var cards = document.querySelectorAll('.card[data-url]');
    for (var i = 0; i < cards.length; i++) {
      cards[i].addEventListener('click', function (e) {
        if (e.target.closest('a')) return;
        var url = this.getAttribute('data-url');
        if (url) window.location.href = url;
      });
    }
  }

  function boot () {
    initHomeSearch();
    initProgress();
    initTOC();
    initArchiveFilters();
    initCardClicks();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', boot);
  } else {
    boot();
  }
})();
