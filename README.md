# com.android.volley

Unofficial mirror for com.android.volley binary (aar) distributions

## Goal

While hosting specific versions for other people is out of the scope for this
project, it is however set up to be easily forkable in order to host your own
maven repository for Volley binary distributions.

## Configuration

```bash
# gradle-local.properties
androidHome={path to the Android SDK (/opt/android/sdk)}
artifactGroupId={group id for generated maven artifact (tv.tape.android-volley)}
```

## Build new version

First you have to figure out based on which upstream branch or tag you want to build a new version.

```bash
$ ./gradlew upstreamBranches
$ ./gradlew upstreamTags
```

Then you choose a new version number for your own build and build it with the following command:

```bash
# Publish your own version `1.0.0` based on upstream branch `master`
$ ./gradlew publishLibrary -P aarVersion=1.0.0 -P upstreamVersion=master -P upstreamType=branch

# Publish your own version `1.5.0` based on upstream tag `android-m-preview`
$ ./gradlew publishLibrary -P aarVersion=1.5.0 -P upstreamVersion=android-m-preview -P upstreamType=tag
```

When the library could not be built because of a gradle version mismatch check
the output for the required gradle version and define it with `-P upstreamGradleVersion={version}`.

## Using a version in your Android project

```
# build.gradle (root)

allprojects {
    repositories {
        maven { url "http://tape-tv.github.io/com.android.volley" }
    }
}

# {module}/build.gradle
dependencies {
    compile 'tv.tape.android-volley:library:1.0.0-tapetv'
}
```
