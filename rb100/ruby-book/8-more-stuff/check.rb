# frozen_string_literal: true

arr = ['laboratory', 'experiment', 'Pans Labyrinth', 'elaborate', 'polar bear']

p arr.select { _1.include?('lab') }
