module.exports = function(grunt) {
  var fs = require('fs');
  fs.readdirSync('./routes');
  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      build: {
        files: {
          'public/javascripts/app.min.js': 'public/javascript/**/*.js'
        }
      }
    },
    stylus: {
      options: {
        linenos: true,
        compress: false
      },
      compile: {
        files: {
          'public/stylesheets/style.css': 'public/stylesheets/**/*.styl' // compile and concat into single file
        }
      }
    },
    cssmin: {
      build: {
        files: {
          'public/stylesheets/style.min.css': ['public/stylesheets/style.css']
        }
      }
    },
    coffee: {
      compileApp: {
        options: {
          bare: true
        },
        files: {
          'app.js': 'app.coffee'
        }
      },
      compileRoutes: {
        files: [{
          expand: true,
          cwd: './routes',
          src: ['**/*.coffee'],
          dest: './routes',
          rename: function(dest, src) {
            return dest + '/' + src.replace(/\.coffee$/, '.js');
          }
        }]
      }
    },
    express: {
      options: {},
      dev: {
        options: {
          script: 'app.js'
        }
      }
    },
    watch: {
      express: {
        files: ['**/*.jade', "**/*.coffee"],
        tasks: ['coffee', 'express', 'watch:express'],
        options: {
          livereload: true,
          nospawn: true // for grunt-contrib-watch v0.5.0+, "nospawn: true" for lower versions. Without this option specified express won't be reloaded
        }
      },
      static: {
        files: ['public/**'],
        options: {
          livereload: true,
          nospawn: true // for grunt-contrib-watch v0.5.0+, "nospawn: true" for lower versions. Without this option specified express won't be reloaded
        }
      }
    }
  });
  // Load Grunt tasks declared in the package.json file
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);
  // Default task(s).
  grunt.registerTask('default', ['express', 'watch']);
  grunt.registerTask('build', ['stylus', 'cssmin', 'coffee', 'uglify']);
};