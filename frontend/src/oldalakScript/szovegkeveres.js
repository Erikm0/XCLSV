export function getRandomChar() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!?@#$%^&*';
    return chars[Math.floor(Math.random() * chars.length)];
}

export function kever(el) {
    if (!el) return;
    const eredetiSzoveg = el.dataset.text || el.innerText;
    let jelenlegiSzoveg = Array(eredetiSzoveg.length).fill('');
    let kesz = Array(eredetiSzoveg.length).fill(false);
    let frame = 0;


    if (el._keverInterval) {
        clearInterval(el._keverInterval);
    }
    let interval = setInterval(() => {
        let allDone = true;
        for (let i = 0; i < eredetiSzoveg.length; i++) {
            if (!kesz[i]) {
                if (frame > i * 2) {
                    kesz[i] = true;
                    jelenlegiSzoveg[i] = eredetiSzoveg[i];
                } else {
                    jelenlegiSzoveg[i] = getRandomChar();
                    allDone = false;
                }
            }
        }
        el.innerText = jelenlegiSzoveg.join('');
        frame++;
        if (allDone) clearInterval(interval);
    }, 50);

    el._keverInterval = interval;
}

document.querySelectorAll('.newsLetter').forEach(el => {
    el.addEventListener('mouseenter', () => {
        kever(el);
    });
});
