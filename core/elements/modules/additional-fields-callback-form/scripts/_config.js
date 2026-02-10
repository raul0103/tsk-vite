let config = {
  forms: [
    {
      id: "callback", // ID формы
      insertion: {
        element: "button[type='submit']", // Элемент рядом с которым будет вставка кнопки
        side: "before", // after or before - положение относительно insertion.element
      },
    },
    {
      id: "header-callback",
      insertion: {
        element: "button[type='submit']",
        side: "before",
      },
    },
    {
      id: "discount",
      insertion: {
        element: "button[type='submit']",
        side: "before",
      },
    },
    {
      id: "cost-delivery",
      insertion: {
        element: "button[type='submit']",
        side: "before",
      },
    },
    {
      id: "showroom",
      insertion: {
        element: "button[type='submit']",
        side: "before",
      },
    },
    {
      id: "help-in-choice",
      insertion: {
        element: "button[type='submit']",
        side: "before",
      },
    },
  ],
};

export default config;
