
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  if(htmlElement.hasChildNodes()) {
    // htmlElement.empty();
    htmlElement.innerHTML = "";
  }
    let p = document.createElement('p');
    p.innerText = string;
    htmlElement.appendChild(p);
};

htmlGenerator('Party Time.', partyHeader);