import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["You can’t buy happiness…", "but you can buy tequila.", "And that’s kind of the same thing." ],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
