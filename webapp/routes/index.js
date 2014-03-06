
/*
 * GET home page.
 */

(function() {
  exports.index = function(req, res) {
    res.render("index", {
      title: "Express Wo"
    });
  };

}).call(this);
