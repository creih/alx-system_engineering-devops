# task 1 kwenstalla flask
package { 'flask':
  ensure   => 'installed',
  provider => 'pip3',
}
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
