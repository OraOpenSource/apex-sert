///////////////////////////////////////////////////////////////////////////
// sv.js version @SV_VERSION@
// JavaScript Support Files for APEX-SERT
///////////////////////////////////////////////////////////////////////////

//FUNCTION: svScan
// Initiates the security scan for an application
function svScan(pAppId,pAttributeSetId,pPageId,pRequest)
{

  // Set the Attribute Set ID and App ID in session state
  apex.server.process("initScan",
    {
      x01: pAttributeSetId,
      x02: pAppId
    },                 
    {
      success: function (pData)
      {
      }
    }                   
  );

  // Set the refresh interval for the progress window
  setInterval("progress()", 500);

  // Prepare the Cancellation URL
  apex.server.process("prepareURL",
    {
      x01: "f?p=" + $v('pFlowId') + ":1:" + $v('pInstance') + ":CANCEL"
    },                 
    {
      success: function (pData)
      {
        gCancelURL = pData[0].url;
      }
    }                   
  );

  // Prepare the URL
  apex.server.process("prepareURL",
    {
      x01: "f?p=" + $v('pFlowId') + ":" + pPageId + ":" + $v('pInstance') + ":" + pRequest
    },                 
    {
      success: function (pData)
      {
        window.top.location = pData[0].url;
        d = apex.jQuery('<div id="popup" class="popup"><div class="popupbody">' +
          '<div id="progressMessage" style="padding:20px;">Processing - please wait.</div></div></div>');
        d.dialog({
          title: 'Processing Application ' + pAppId,
          bgiframe: true,
          width: 500,
          height: 200,
          modal: true,
          draggable: false,
          resizable: false,
          closeOnEscape: false,
          dialogClass: 'no-close',
          buttons:
            {
              Cancel: function()
              {
              window.location=gCancelURL;
              }
            }
          })
        }
      }                   
    );
}


//FUNCTION: apexLink
// Records when someone clicks on an APEX edit link
function apexLink(gPageId, gRP, gLink, gComponent, gCategory)
{
  apex.server.process("saveApexLink",
    {
      x01: gPageId,
      x02: gLink,
      x03: gRP,
      x04: gComponent,
      x05: gCategory
    },                 
    {
      success: function (pData)
      {
      var url = 'f?p=4000:' + gPageId + ':' + gApexSession + '::NO:' + gRP +':' + gLink;
      newWin = window.open( url );
      }
    }                   
  );
}

//FUNCTION: viewSource
// Pops up window for source
function viewSource(pId, pComponentType)
{
  apex.server.process("viewSource",
    {
      x01: pId,
      x02: pComponentType
    },                 
    {
      success: function (pData)
      {
      d = apex.jQuery('<div id="apex_item_help_text"><pre class="brush: SERT;">' + pData[0].source + '</pre></div>');
      d.dialog({
        title: pData[0].title,
        bgiframe: true,
        width: 700,
        height: 600,
        modal: true,
        draggable: false,
        buttons: {}
        })
      }
    }                   
  );
}


// FUNCTION: getInfo
// Pops up the Info window for a specific attribute
function getInfo (pAttrId, pAppProc, w, h, pType)
{
  apex.server.process(pAppProc,
    {
      x01: pAttrId,
      x02: pType
    },                 
    {
      success: function (pData)
      {
      d = apex.jQuery('<div style="padding-left:12px;padding-right:12px;">' + pData[0].info + '</div>');
      d.dialog({
        title: pData[0].label,
        bgiframe: true,
        width: w,
        height: h,
        modal: true,
        draggable: false,
        buttons: {}
        })
      }
    }                   
  );
}


// FUNCTION progress
function progress()
{
  apex.server.process("getProgress",
    {
    },                 
    {
      success: function (pData)
      {
      $x('progressMessage').innerHTML = pData[0].title + pData[0].value;
      }
    }                   
  );
}


function HtmlEncode(s)
{
  var el = document.createElement("div");
  el.innerText = el.textContent = s;
  s = el.innerHTML;
  delete el;
  return s;
}

// http://harmen.no-ip.org/javascripts/diff/
// http://stackoverflow.com/questions/4462609
function diff_text(text1, text2) {
  var table = '';

  function make_row(x, y, type, text) {
    if (type == ' ') console.log(x, y);
    var row = '<tr';
    if (type == '+') row += ' class="add"';
    else if (type == '-') row += ' class="del"';
    row += '>';

    row += '<td class="lineno">' + y;
    row += '<td class="lineno">' + x;
    row += '<td class="difftext">' + type + ' ' + HtmlEncode(text);

    table += row;
  }

  function get_diff(matrix, a1, a2, x, y) {
    if (x > 0 && y > 0 && a1[y-1] === a2[x-1]) {
      get_diff(matrix, a1, a2, x-1, y-1);
      make_row(x, y, ' ', a1[y-1]);
    }
    else {
      if (x > 0 && (y === 0 || matrix[y][x-1] >= matrix[y-1][x])) {
        get_diff(matrix, a1, a2, x-1, y);
        make_row(x, '', '+', a2[x-1]);
      }
      else if (y > 0 && (x === 0 || matrix[y][x-1] < matrix[y-1][x])) {
        get_diff(matrix, a1, a2, x, y-1);
        make_row('', y, '-', a1[y-1]);
      }
      else {
        return;
      }
    }
  }

  function diff(a1, a2) {
    var matrix = new Array(a1.length + 1);
    var x, y;

    for (y = 0; y < matrix.length; y++) {
      matrix[y] = new Array(a2.length + 1);

      for (x = 0; x < matrix[y].length; x++) {
        matrix[y][x] = 0;
      }
    }

    for (y = 1; y < matrix.length; y++) {
      for (x = 1; x < matrix[y].length; x++) {
        if (a1[y-1] === a2[x-1]) {
          matrix[y][x] = 1 + matrix[y-1][x-1];
        }
        else {
          matrix[y][x] = Math.max(matrix[y-1][x], matrix[y][x-1]);
        }
      }
    }

    get_diff(matrix, a1, a2, x-1, y-1);
  }

  diff(text1.split('\n'), text2.split('\n'));

  return '<table class="diff_text">' + table + '</table>';
}

function getDiff(text1, text2)
{
var table = document.getElementById('comparison').innerHTML = diff_text(text1, text2);
}

function importFile()
{
d = apex.jQuery('<div id="popup" class="popup"><div class="popupbody">' +
  '<div id="progressMessage" >Importing File and Recalculating Scores - please wait.</div></div></div>');
d.dialog({
  title: 'Importing File',
  bgiframe: true,
  width: 400,
  height: 150,
  modal: true,
  draggable: false,
  resizable: false,
  closeOnEscape: true
  })
  ;
apex.submit('CREATE');
}
