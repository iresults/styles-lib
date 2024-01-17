# iresults/styles-lib

Sass library with utilities

## Installation

### composer

```json
{
    "require": {
        "iresults/styles-lib": "*"
    }
}
```

## Usage

Before the some of the libraries features can be used, the breakpoints, container widths and grid have to be configured:

```scss
$grid-breakpoints: (
    xs: 0,
    sm: 576px,
    md: 768px,
    lg: 992px,
    xl: 1200px,
    xxl: 1400px,
);
$container-max-widths: (
    xs: 100%,
    sm: 100px,
    md: 200px,
    lg: 300px,
    xl: 400px,
    xxl: 500px,
    xxxl: 600px,
);
$grid-configuration: (
    columns: 12,
    gap: 1rem,
);
@include lib.configure(
    $grid-breakpoints,
    $container-max-widths,
    $grid-configuration
);
```

### Examples

```scss
@include lib.configure(/* ... */);

@include lib.debug-grid();
@include lib.debug-screen-breakpoints();

body::before {
    width: lib.rem-calc(16px);
    height: lib.unit-strip(16px);
}

.container {
    @include lib.container-apply-widths();
}

.container-with-extra {
    @include lib.container-apply-widths(20px);
}
```
