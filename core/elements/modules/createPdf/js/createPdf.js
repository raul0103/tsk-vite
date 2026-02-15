import latoRegular from "./latoRegular";

const API_URL = "/korzina/";

console.log("CreatePDF module registered");

export async function createPdf(pdfFileName = "zakaz_skidki-plus.pdf") {
  // ⬇️ ленивый импорт библиотек
  const [{ jsPDF }, autoTableModule] = await Promise.all([
    import("jspdf"),
    import("jspdf-autotable")
  ]);

  // важно для autotable (он патчит jsPDF)
  const autoTable = autoTableModule.default;

  const cartProducts = await fetchProducts();

  if (!cartProducts) {
    console.log("createPdf aborted: empty cart");
    return;
  }

  const today = new Date();

  const doc = new jsPDF({
    orientation: "portrait",
    unit: "mm",
    format: "a4",
  });

  // добавляем шрифт
  doc.addFileToVFS("Lato-Regular.ttf", latoRegular);
  doc.addFont("Lato-Regular.ttf", "Lato", "normal");
  doc.setFont("Lato");

  doc.setFontSize(14);

  doc.text(
    `Заказ от ${today.getDate()}/${today.getMonth() + 1}/${today.getFullYear()} ${window.location.host}`,
    10,
    10
  );

  const tableColumnHeaders = ["#", "Арт.", "Наименование", "Количество", "Стоимость, руб."];

  const tableRows = cartProducts.map((product, index) => [
    index + 1,
    product.article,
    product.name || "-",
    product.count || 0,
    `${(product.price * product.count).toFixed(2)}`
  ]);

  const totalPrice = cartProducts.reduce(
    (sum, p) => sum + p.price * (p.count || 1),
    0
  );

  tableRows.push(["", "", "Итого:", "", `${totalPrice.toFixed(2)} руб.`]);

  // используем autotable
  autoTable(doc, {
    head: [tableColumnHeaders],
    body: tableRows,
    startY: 20,
    theme: "grid",
    headStyles: { font: "Lato", fillColor: [100, 100, 100] },
    bodyStyles: { font: "Lato", overflow: "linebreak" },
    styles: { halign: "center", font: "Lato" },
  });


  doc.save(pdfFileName);
}

async function fetchProducts() {
  try {
    const response = await fetch(API_URL, {
      method: "POST",
      headers: {
        "X-Requested-With": "fetch",
        "Content-Type": "application/json",
      },
    });

    const data = await response.json();

    if (!data.success || !data.products?.length) {
      throw new Error("Received bad data");
    }

    return data.products;
  } catch (e) {
    console.warn("Error creating PDF:", e);
    return false;
  }
}
