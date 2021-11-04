# tempa
Sistem Manajemen Sampah Berbasis Website
# This workflow uses actions that are not certified by GitHub.
# They are provided by a third-party and are governed by
# separate terms of service, privacy policy, and support
# documentation.

name: Label issues
on:
  issues:
    types:
      - reopened
      - opened
jobs:
  label_issues:
    runs-on: ubuntu-latest
    permissions:
      issues: write
    steps:
      - name: Label issues
        uses: andymckay/labeler@5c59dabdfd4dd5bd9c6e6d255b01b9d764af4414
        with:
          add-labels: "triage"
          repo-token: ${{ secrets.GITHUB_TOKEN }}
